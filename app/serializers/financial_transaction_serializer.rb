class FinancialTransactionSerializer < ActiveModel::Serializer
  attributes :type_id, :datetime, :value, :cpf, :card_number

  def attributes(*args)
    transaction = super(*args)
    transaction[:datetime] = object.datetime.strftime('%Y-%m-%d %H:%M:%S:%L%z') if object.datetime.present?
    transaction
  end
end
