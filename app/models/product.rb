class Product < ApplicationRecord
	has_one_attached :image



	def self.import(file)
    byebug
  	 spreadsheet = open_spreadsheet(file)
  	header = spreadsheet.row(1)
  	(2..spreadsheet.last_row).each do |i|
  	row = Hash[[header, spreadsheet.row(i)].transpose]
  	product = find_by_id(row["id"]) || new
  	product.attributes = row.to_hash
  	product.save!
  	end
  end



def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
  when ".xls" then Roo::Excel.new(file.path)
  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end
end
