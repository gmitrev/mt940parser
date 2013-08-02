module MT940
  class Parser

    base_path = File.dirname(__FILE__)
    Treetop.load(File.expand_path(File.join(base_path, 'r86.treetop')))
    Treetop.load(File.expand_path(File.join(base_path, 'document.treetop')))
    require File.join(base_path, 'node_extensions')

    @@parser = DocumentParser.new

    def self.parse(data)
      tree = @@parser.parse(data)

      self.show_error(data) if tree.nil?

      # clean up the tree by removing all nodes of default type 'SyntaxNode'
      self.clean_tree(tree)

      return tree
    end

    private

    def self.show_error(data)
      @@parser.failure_reason =~ /^(Expected .+) after/m
      puts "#{$1.gsub("\n", '$NEWLINE')}:", data.lines.to_a[@@parser.failure_line - 1],"#{'~' * (@@parser.failure_column - 1)}^"
    end

    def self.clean_tree(root_node)
      return if(root_node.elements.nil?)
      root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
      root_node.elements.delete_if{|node| node.class.name == "Mt940::NewLine" } #remove nls
      root_node.elements.delete_if{|node| node.class.name == "R86::Blank" } #remove nls
      root_node.elements.each {|node| self.clean_tree(node) }
    end

  end
end
