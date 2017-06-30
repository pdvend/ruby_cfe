require 'br_invoices_pdf/cfe/parser'
require 'br_invoices_pdf/cfe/renderer'

module BrInvoicesPdf
  module Cfe
    BrInvoicesPdf.register(:cfe, Cfe::Renderer, Cfe::Parser)
  end
end