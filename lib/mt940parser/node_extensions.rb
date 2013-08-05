module Document

  class Transaction < Treetop::Runtime::SyntaxNode
    def to_hash
      base.to_hash.merge(statement.to_hash)
    end
  end

  class All < Treetop::Runtime::SyntaxNode

    def to_hash
      elements.map(&:to_hash)
    end

    def transactions
      elements.flat_map(&:to_hash)
    end

    def transactions_credit
      transactions.select{ |t| t[:type] == :credit}
    end

    def transactions_debit
      transactions.select{ |t| t[:type] == :debit }
    end

    # Utility
    def a
      all_transactions.sample
    end
  end
  class Transactions < Treetop::Runtime::SyntaxNode
    def to_hash
      elements.flat_map(&:to_hash)
    end
  end
  class Statement < Treetop::Runtime::SyntaxNode
  end
  class Record < Treetop::Runtime::SyntaxNode
    def to_hash
      elements.select{ |e| e.class == Document::Transactions }.flat_map(&:to_hash)
    end
  end

  class Base < Treetop::Runtime::SyntaxNode
    def to_hash
      {
        valor: valor.text_value,
        account_date: account_date.text_value,
        type: type.val,
        amount: amount.val
      }
    end
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
    def val
      text_value == 'C' ? :credit : :debit
    end
  end
  class Amount < Treetop::Runtime::SyntaxNode
    def val 
      text_value.sub(',','.').to_f
    end
  end
  class NotImplemented < Treetop::Runtime::SyntaxNode
    def to_hash
      {}
    end
  end
  class NewLine < Treetop::Runtime::SyntaxNode
  end

  class Date < Treetop::Runtime::SyntaxNode
    def to_hash
      {}
    end

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
    def val
      text_value.strip[3..-1]
    end
  end
  class Details < Treetop::Runtime::SyntaxNode
    def val
      text_value.strip[3..-1]
    end
  end
  class Detail < Treetop::Runtime::SyntaxNode
  end
  class Statement < Treetop::Runtime::SyntaxNode
    def to_hash
      {
        code: code.text_value,
        description: description.val,
        details: details.val
      }
    end
  end
  class Code < Treetop::Runtime::SyntaxNode
  end
  class NewLine < Treetop::Runtime::SyntaxNode
  end
  class Blank < Treetop::Runtime::SyntaxNode
  end

end
