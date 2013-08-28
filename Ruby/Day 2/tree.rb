class Tree
  attr_accessor :children, :node_name

  def initialize(hash)
    @node_name = hash.keys[0]
    @children = hash[@node_name].map{|k, v| Tree.new(k => v)}
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

h = {'grandpa' => { 'dad' => {'child1' => {}, 'child2' => {}},
                    'uncle' => {'child3' => {}, 'child4' => {}}}}

t = Tree.new(h)
t.visit {|node| puts node.node_name}
puts
t.visit_all {|node| puts node.node_name}
