class Cell 
    attr_accessors :alive, :position_x, :position_y, :aside, :state_cell
    def initialize 
        @alive = false
        @position_x = 0
        @position_y = 0
        @aside = []
        @state_cell = 0
    end

    def cell_dies
        @alive = false 
    end

    def cell_revives
        @alive = true
    end
end

class  Game_table 
    attr_accessors :table_height, :table_width, :table, :number_generation
    def initialize(table_height, table_width)
        @number_generation = 1
        @table_height = table_height
        @table_width = table_width
        @create_table 
    end

    attr_reader :table

    def table_print 
        puts "Table number #{@number_generation}"
        @table_height.times do |i|
            @table_width.times do |j|
                if @table[i][j].alive === 0
                    print "."
                else
                    print "*"
                end
            end
            puts ""
        end
        puts " "
    end

    def update_table
        @number_generation += 1
        @table.each do |row|
            row.each do |cell|
                cell.alive = state_cell
            end
        end
    end

    def create_table
        array = Array.new(@table_height) {Array.new(@table_width) {Cell.new}}
        @table_height.times do |i|
            @table_width.times do |j|
                array[i][j].position_x = j
                array[i][j].position_y = i
                rand(1..100).between?(60,100) ? array[i][j].cell_revives : array[i][j].cell_dies
            end
        end
        @table = array
    end
end


