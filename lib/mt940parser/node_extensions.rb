module Document

  class Transaction < Treetop::Runtime::SyntaxNode
    def details
      elements.last.elements.last.text_value
    end

    def policy_numbers
      details.scan(/\d{3,}/)
    end
  end

  class All < Treetop::Runtime::SyntaxNode
    def all_transactions
      elements.map(&:t).map(&:elements).flatten
    end

    def all_policy_numbers
      all_transactions.map(&:policy_numbers).reject(&:empty?)
    end

    def all_credit
      all_transactions.select { |t| t.base.type.text_value == "C" }
    end

    def all_debit
      all_transactions.select { |t| t.base.type.text_value == "D" }
    end

    # Utility
    def a
      all_transactions.sample
    end
  end
  class Transactions < Treetop::Runtime::SyntaxNode
  end
  class Statement < Treetop::Runtime::SyntaxNode
  end
  class Record < Treetop::Runtime::SyntaxNode
    def t
      elements.last
    end
  end

  class Base < Treetop::Runtime::SyntaxNode
  end
  class Digit < Treetop::Runtime::SyntaxNode
  end
  class All < Treetop::Runtime::SyntaxNode
  end
  class Cods < Treetop::Runtime::SyntaxNode
  end
  class Valor < Treetop::Runtime::SyntaxNode
  end
  class AccountDate < Treetop::Runtime::SyntaxNode
  end
  class Type < Treetop::Runtime::SyntaxNode
  end
  class Amount < Treetop::Runtime::SyntaxNode
    def val 
      text_value.sub(',','.').to_f
    end
  end
  class NotImplemented < Treetop::Runtime::SyntaxNode
  end
  class NewLine < Treetop::Runtime::SyntaxNode
  end

  class Date < Treetop::Runtime::SyntaxNode
    def val
      text_value.strip[4..-1]
    end
  end

end

module R86
  class NotImplemented < Treetop::Runtime::SyntaxNode
  end
  class Mark < Treetop::Runtime::SyntaxNode
  end
  class Description < Treetop::Runtime::SyntaxNode
  end
  class Details < Treetop::Runtime::SyntaxNode
  end
  class Detail < Treetop::Runtime::SyntaxNode
  end
  class Statement < Treetop::Runtime::SyntaxNode
  end
  class Code < Treetop::Runtime::SyntaxNode
  end
  class NewLine < Treetop::Runtime::SyntaxNode
  end
  class Blank < Treetop::Runtime::SyntaxNode
  end

end
