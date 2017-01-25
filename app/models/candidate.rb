class Candidate < ApplicationRecord


	def self.calculate(id_candidate)
		candidate = find_by_id_candidate(id_candidate)
		candidate
	end
	
end
