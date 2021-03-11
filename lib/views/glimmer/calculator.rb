require 'easily_typable'

require 'models/glimmer/calculator/presenter'

module Glimmer
  class Calculator
    include Glimmer

    def initialize
      @presenter = Presenter.new
    end

    def open
      tk_root.open
    end

    protected

    attr_reader :presenter

    def tk_root
      root {
        title 'Glimmer - Calculator'
        
        frame {        
          grid column: 0, row: 0, padx: 5, pady: 5
          
          entry {
            grid column: 0, row: 0, columnspan: 4, sticky: 'ew', padx: 2, pady: 2
            text bind(presenter, :result)
          }
          
          command_button('AC', 1, 0)
          operation_button('÷', 1, 1)
          operation_button('×', 1, 2)
          operation_button('−', 1, 3)

          (7..9).each.with_index { |number, idx|
            number_button(number, 2, idx)
          }
          operation_button('+', 2, 3, rowspan: 2)
          (4..6).each.with_index { |number, idx|
            number_button(number, 3, idx)
          }
          (1..3).each.with_index { |number, idx|
            number_button(number, 4, idx)
          }
          command_button('=', 4, 3, rowspan: 2)
          number_button(0, 5, 0, colspan: 2)
          operation_button('.', 5, 2)
        }
      }
    end

    def number_button(number, row, column, options = {})
      command_button(number, row, column, options)
    end

    def operation_button(op, row, column, options = {})
      command_button(op, row, column, options)
    end

    def command_button(cmd, row, column, options = {})
      cmd = cmd.to_s
      rspan = options[:rowspan] || 1
      cspan = options[:colspan] || 1

      button {
        grid(
          column: column, row: row, rowspan: rspan, columnspan: cspan,
          padx: 2, pady:2, sticky: 'nsew'
        )
        text cmd
        command { presenter.press(cmd) }
      }
    end
  end
end
