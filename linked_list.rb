class LinkedList
	attr_accesor :head

	def initialize(val)
		@head = LinkedList::Node.new(val, nil)
	end

	def new_node(val)
		current = @head 
		while current.next != nil
			current = current.next
		end
		current.next = LinkedList::Node.new(val, nil)
	end

	def delete(val)
		current = @head
		if current.val == val
			@head = current.next
		else
			while (current.next != nil) && (current.next.val != val)
        		current = current.next
      		end
      		unless current.next == nil
        		current.next = current.next.next
      		end	
		end
	end

	def return_list
		elements = []
		current = @head
	    while current.next != nil
	      elements << current
	      current = current.next
	    end
	    elements << current
	end

	class Node
		attr_accessor :val, :next

		def initialize(val, next_node)
			@val = val
			@next_node = next_node 
		end
	end	

end