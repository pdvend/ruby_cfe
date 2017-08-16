module BrInvoicesPdf
  module Cfe
    module Renderer
      module Totals
        extend BaseRenderer

        module_function

        def execute(pdf, data)
          xpos = 0
          ypos = pdf.cursor
          third_width = page_content_width(pdf) * 0.333333333
          box_info(data).each do |(title, value)|
            box(pdf, [xpos, ypos], third_width) do
              pdf.text(title, style: :italic)
              pdf.text(value, align: :right)
            end

            xpos += third_width
          end

          pdf.move_down(5)
        end

        def box_info(data)
          [
            ['Total bruto dos itens', format_currency(BigDecimal(data[:payment][:total_price]))],
            ['Desconto', format_currency(BigDecimal(data[:payment][:discount]))],
            ['Total', format_currency(BigDecimal(data[:payment][:total]))]
          ]
        end
        private_class_method :box_info
      end
    end
  end
end