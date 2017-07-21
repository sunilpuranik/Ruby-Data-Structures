
class MyBeautifulHash
	attr_accessor :buckets 

	def initialize(num_buckets=256)
		@buckets = []
		size.times.each {|r| @buckets[r] = [] } 
		@buckets
	end

	def insert(key, value)
		@buckets[hash_code(key)] << [key, value]
	end

	def access(key)
		return nil if @buckets[hash_code(key)].nil?
		@buckets[hash_code(key)].each_with_index do |inkeyvalue, index| 
			k, v = inkeyvalue
			if k == key
				return v
			end
		end
		# If key not found 
		return nil
	end

	def hash_code(key)
		key.intern.object_id % @buckets.length
	end
end