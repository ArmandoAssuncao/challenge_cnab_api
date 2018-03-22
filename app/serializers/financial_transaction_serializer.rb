class FinancialTransactionSerializer < ActiveModel::Serializer
  attributes :type_id, :datetime, :value, :cpf, :card_number

  def attributes(*args)
    transaction = super(*args)
    if object.datetime.present?
      transaction[:datetime] = object.datetime.strftime('%Y-%m-%d %H:%M:%S:%L%z')
    end
    transaction
  end
end
