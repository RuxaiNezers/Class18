class Table
    attr_accessor :table, :rec
    def initialize(table,*rec)
        @table = table
        @rec = rec.map(&:to_i)
    end

    def self.casino(file)
       data = []
        File.readlines(file).each do |line|
        newdata = line.split(', ').map(&:chomp)
        table, rec = newdata.shift, newdata
        data << Table.new(table,*rec)
        end

=begin  IMPRIMIR LOS DATOS DE 'data'
       data.each do |valor|
            puts "#{valor.table}, #{valor.rec}"
         end
=end         
         return data
    end

    def self.max(file)
        data  = Table.casino(file)
        data.each do |valor|
            puts "la #{valor.table}, el dia #{valor.rec.index(valor.rec.max) + 1}, recaudo #{valor.rec.max}"
         end
    end

    def self.average(file)
        data  = Table.casino(file)
        data.each do |valor|
            puts "la #{valor.table}, recaudo en promedio #{(valor.rec.sum)/valor.rec.size.to_i}"
         end
    end
end

Table.max('casino.txt')
Table.average('casino.txt')

