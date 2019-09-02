# node by id
def to_node_by_id(nodes)
   h ={}
   nodes.each do |node|
      id = node[:id]
      h[id] = node
   end
   h
end

# Children by a node
def to_ids_by_pid(nodes)
   h ={}
   nodes.each do |node|
      pid = node[:pid]
      h[pid] ||= []
      h[pid] << node[:id]
   end
   h
end

def print_node(node)
   puts "id: #{node[:id]}, name: #{node[:name]}, pid: #{node[:pid]}"
end

def print_tree(nodes)
   node_by_id = to_node_by_id(nodes)
   ids_by_pid = to_ids_by_pid(nodes)

   node_ids = ids_by_pid[-1].sort.reverse
   while ( node_ids.size > 0 )
      id = node_ids.pop

      node = node_by_id[id]
      print_node(node)
      child_ids = ids_by_pid[id]
      next if child_ids.nil? || child_ids.empty?
      node_ids += child_ids.sort.reverse
   end
end

nodes = [
   {
      id: 0,
      name: 'root1',
      pid: -1
   },
   {
      id: 1,
      name: 'root2',
      pid: -1
   },
   {
      id: 2,
      name: 'root3',
      pid: -1
   },
   {
      id: 3,
      name: 'child11',
      pid: 1
   },
   {
      id: 4,
      name: 'child12',
      pid: 1
   },
   {
      id: 5,
      name: 'child21',
      pid: 2
   },
   {
      id: 6,
      name: 'child22',
      pid: 2
   }
]

print_tree(nodes)
