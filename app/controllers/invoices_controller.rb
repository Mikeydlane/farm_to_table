class InvoicesController < ApplicationController

  def index
    @invoices = current_user.invoices
  end

  def show
    @invoice = Invoice.find(params[:id])
  end
  
end
