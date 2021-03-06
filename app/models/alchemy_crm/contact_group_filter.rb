# encoding: UTF-8
module AlchemyCrm
  class ContactGroupFilter < ActiveRecord::Base

    attr_accessible(
      :column,
      :operator,
      :value,
      :contact_group
    )

    belongs_to :contact_group

    OPERATORS = [
      [::I18n.t(:like, :scope => 'alchemy_crm.contact_group_filter_operators', :default => 'Contains'), "LIKE"],
      [::I18n.t(:not_like, :scope => 'alchemy_crm.contact_group_filter_operators', :default => 'Contains not'), "NOT LIKE"],
      [::I18n.t(:equals, :scope => 'alchemy_crm.contact_group_filter_operators', :default => 'Equals'), "="],
      [::I18n.t(:equals_not, :scope => 'alchemy_crm.contact_group_filter_operators', :default => 'Equals not'), "!="]
    ]

    def sql_string
      return "" if column.blank? || operator.blank? || prepared_value.blank?
      "`#{Contact.table_name}`.`#{column}` #{operator} '#{prepared_value}'"
    end

  private

    def prepared_value
      operator =~ /LIKE/ ? "%#{value}%" : "#{value}"
    end

  end
end
