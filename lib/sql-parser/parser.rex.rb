#--
# DO NOT MODIFY!!!!
# This file is automatically generated by rex 1.0.5
# from lexical definition file "lib/sql-parser/parser.rex".
#++

require 'racc/parser'
class SQLParser::Parser < Racc::Parser
  require 'strscan'

  class ScanError < StandardError ; end

  attr_reader   :lineno
  attr_reader   :filename
  attr_accessor :state

  def scan_setup(str)
    @ss = StringScanner.new(str)
    @lineno =  1
    @state  = nil
  end

  def action
    yield
  end

  def scan_str(str)
    scan_setup(str)
    do_parse
  end
  alias :scan :scan_str

  def load_file( filename )
    @filename = filename
    open(filename, "r") do |f|
      scan_setup(f.read)
    end
  end

  def scan_file( filename )
    load_file(filename)
    do_parse
  end


  def next_token
    return if @ss.eos?
    
    # skips empty actions
    until token = _next_token or @ss.eos?; end
    token
  end

  def _next_token
    text = @ss.peek(1)
    @lineno  +=  1  if text == "\n"
    token = case @state
    when nil
      case
      when (text = @ss.scan(/\"[0-9]+-[0-9]+-[0-9]+\"/i))
         action { [:date_string, Date.parse(text)] }

      when (text = @ss.scan(/\'[0-9]+-[0-9]+-[0-9]+\'/i))
         action { [:date_string, Date.parse(text)] }

      when (text = @ss.scan(/\'/i))
         action { @state = :STRS;  [:quote, text] }

      when (text = @ss.scan(/\"/i))
         action { @state = :STRD;  [:quote, text] }

      when (text = @ss.scan(/[0-9]+/i))
         action { [:unsigned_integer, text.to_i] }

      when (text = @ss.scan(/\w+\(\)/i))
         action { [:built_in_function, text] }

      when (text = @ss.scan(/\s+/i))
        ;

      when (text = @ss.scan(/\bEXPLAIN\b/i))
         action { [:EXPLAIN, text] }

      when (text = @ss.scan(/\bDESCRIBE\b/i))
         action { [:DESCRIBE, text] }

      when (text = @ss.scan(/\bDESC\b/i))
         action { [:DESC, text] }

      when (text = @ss.scan(/\bSELECT\b/i))
         action { [:SELECT, text] }

      when (text = @ss.scan(/\bDISTINCT\b/i))
         action { [:DISTINCT, text] }

      when (text = @ss.scan(/\bDATE\b/i))
         action { [:DATE, text] }

      when (text = @ss.scan(/\bASC\b/i))
         action { [:ASC, text] }

      when (text = @ss.scan(/\bAS\b/i))
         action { [:AS, text] }

      when (text = @ss.scan(/\bFROM\b/i))
         action { [:FROM, text] }

      when (text = @ss.scan(/\bWHERE\b/i))
         action { [:WHERE, text] }

      when (text = @ss.scan(/\bBETWEEN\b/i))
         action { [:BETWEEN, text] }

      when (text = @ss.scan(/\bAND\b/i))
         action { [:AND, text] }

      when (text = @ss.scan(/\bNOT\b/i))
         action { [:NOT, text] }

      when (text = @ss.scan(/\bINNER\b/i))
         action { [:INNER, text] }

      when (text = @ss.scan(/\bINSERT\b/i))
         action { [:INSERT, text] }

      when (text = @ss.scan(/\bINTO\b/i))
         action { [:INTO, text] }

      when (text = @ss.scan(/\bIN\b/i))
         action { [:IN, text] }

      when (text = @ss.scan(/\bORDER\b/i))
         action { [:ORDER, text] }

      when (text = @ss.scan(/\bOR\b/i))
         action { [:OR, text] }

      when (text = @ss.scan(/\bLIKE\b/i))
         action { [:LIKE, text] }

      when (text = @ss.scan(/\bIS\b/i))
         action { [:IS, text] }

      when (text = @ss.scan(/\bNULL\b/i))
         action { [:NULL, text] }

      when (text = @ss.scan(/\bCOUNT\b/i))
         action { [:COUNT, text] }

      when (text = @ss.scan(/\bAVG\b/i))
         action { [:AVG, text] }

      when (text = @ss.scan(/\bMAX\b/i))
         action { [:MAX, text] }

      when (text = @ss.scan(/\bMIN\b/i))
         action { [:MIN, text] }

      when (text = @ss.scan(/\bSUM\b/i))
         action { [:SUM, text] }

      when (text = @ss.scan(/\bGROUP\b/i))
         action { [:GROUP, text] }

      when (text = @ss.scan(/\bBY\b/i))
         action { [:BY, text] }

      when (text = @ss.scan(/\bHAVING\b/i))
         action { [:HAVING, text] }

      when (text = @ss.scan(/\bCROSS\b/i))
         action { [:CROSS, text] }

      when (text = @ss.scan(/\bJOIN\b/i))
         action { [:JOIN, text] }

      when (text = @ss.scan(/\bON\b/i))
         action { [:ON, text] }

      when (text = @ss.scan(/\bLEFT\b/i))
         action { [:LEFT, text] }

      when (text = @ss.scan(/\bOUTER\b/i))
         action { [:OUTER, text] }

      when (text = @ss.scan(/\bRIGHT\b/i))
         action { [:RIGHT, text] }

      when (text = @ss.scan(/\bFULL\b/i))
         action { [:FULL, text] }

      when (text = @ss.scan(/\bUSING\b/i))
         action { [:USING, text] }

      when (text = @ss.scan(/\bEXISTS\b/i))
         action { [:EXISTS, text] }

      when (text = @ss.scan(/\bDESC\b/i))
         action { [:DESC, text] }

      when (text = @ss.scan(/\bCURRENT_USER\b/i))
         action { [:CURRENT_USER, text] }

      when (text = @ss.scan(/\bVALUES\b/i))
         action { [:VALUES, text] }

      when (text = @ss.scan(/\bLIMIT\b/i))
         action { [:LIMIT, text] }

      when (text = @ss.scan(/\bOFFSET\b/i))
         action { [:OFFSET, text] }

      when (text = @ss.scan(/\bFALSE\b/i))
         action { [:FALSE, text] }

      when (text = @ss.scan(/\bTRUE\b/i))
         action { [:TRUE, text] }

      when (text = @ss.scan(/<>/i))
         action { [:not_equals_operator, text] }

      when (text = @ss.scan(/!=/i))
         action { [:not_equals_operator, text] }

      when (text = @ss.scan(/=/i))
         action { [:equals_operator, text] }

      when (text = @ss.scan(/<=/i))
         action { [:less_than_or_equals_operator, text] }

      when (text = @ss.scan(/</i))
         action { [:less_than_operator, text] }

      when (text = @ss.scan(/>=/i))
         action { [:greater_than_or_equals_operator, text] }

      when (text = @ss.scan(/>/i))
         action { [:greater_than_operator, text] }

      when (text = @ss.scan(/\(/i))
         action { [:left_paren, text] }

      when (text = @ss.scan(/\)/i))
         action { [:right_paren, text] }

      when (text = @ss.scan(/\*/i))
         action { [:asterisk, text] }

      when (text = @ss.scan(/\//i))
         action { [:solidus, text] }

      when (text = @ss.scan(/\+/i))
         action { [:plus_sign, text] }

      when (text = @ss.scan(/\-/i))
         action { [:minus_sign, text] }

      when (text = @ss.scan(/\./i))
         action { [:period, text] }

      when (text = @ss.scan(/,/i))
         action { [:comma, text] }

      when (text = @ss.scan(/`\w+`/i))
         action { [:identifier, text[1..-2]] }

      when (text = @ss.scan(/\w+/i))
         action { [:identifier, text] }

      when (text = @ss.scan(/----/i))
        ;

      when (text = @ss.scan(/require/i))
        ;

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    when :STRS
      case
      when (text = @ss.scan(/\'(?=[^\']|$)/i))
         action { @state = nil;    [:quote, text] }

      when (text = @ss.scan(/(?:[^\']|\'\')*/i))
         action {                  [:character_string_literal, text.gsub("''", "'")] }

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    when :STRD
      case
      when (text = @ss.scan(/\"(?=[^\"]|$)/i))
         action { @state = nil;    [:quote, text] }

      when (text = @ss.scan(/(?:[^\"]|\"\")*/i))
         action {                  [:character_string_literal, text.gsub('""', '"')] }

      else
        text = @ss.string[@ss.pos .. -1]
        raise  ScanError, "can not match: '" + text + "'"
      end  # if

    else
      raise  ScanError, "undefined state: '" + state.to_s + "'"
    end  # case state
    token
  end  # def _next_token

end # class
