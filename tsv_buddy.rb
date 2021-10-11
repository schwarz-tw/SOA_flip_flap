# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split("\n").map { |line| line.split("\t") }
    headers = rows.first
    data_rows = rows[1..-1]

    @data = data_rows.map do |row|
      row.map.with_index { |cell, i| [headers[i], cell] }.to_h
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    rows = @data
    headers = rows[0].keys
    output = [] << headers.join("\t") << "\n"
    rows.each { |row| output << headers.map { |header| row[header] }.join("\t") << "\n" }
    output.join
  end
end
