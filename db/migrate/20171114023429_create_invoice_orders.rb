class CreateInvoiceOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_orders do |t|
      t.references :invoice, foreign_key: true
      t.references :order, foreign_key: true
    end
  end
end
