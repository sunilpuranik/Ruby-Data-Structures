class BinarySearchTree 

	class EmptyNode

		def to_a
			[]
		end

		def include?(*)
			false
		end

		def push(*)
			false
		end
		alias_method :<<, :push

		def inspect
			"{}"
		end
	end

	class Node
		attr_reader :value
		attr_reader :left, :right

		def initialize(v)
			@value = v
			@left = EmptyNode.new
			@right = EmptyNode.new
		end

		def push(v)
			case value <=> v
			when 1 then insert_left(v)
			when -1 then insert_right(v)
			when 0  then false
			end
		end

		private 

		def insert_left(v)
			if left
				left.insert(v)
			else 
				self.left = Node.new(v)
			end
		end

		def insert_right(v)
			if right
				right.insert(v)
			else 
				self.right = Node.new(v)
			end
		end

	end

end