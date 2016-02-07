# Increments the last used org in the ORGLOG.log and retrieves it.
def save_mutant_id(new_m_id)
    mutant_id_File = File.new(MUTANT_LOG, 'r+')
    mutant_id_File.puts new_m_id
    mutant_id_File.close

  end

# Retrieves the org from the ORGLOG.log file
def get_mutant_id()
    mutant_id_File = File.new(MUTANT_LOG, 'r')
    lastorg = mutant_id_File.readlines
    mutant_id_File.close

    return lastorg.collect{|x| x.strip}[0]
end

# Write mutant info when created with date to file
# Retrieves the org from the ORGLOG.log file
def log_mutant(action)
    mutant_File = File.new(CUKELOG, 'a+')
    mymutant = @parsed_response
    current_time = Time.now
    mutant_File.puts "#{current_time}:#{action}-#{mymutant}\n"
    mutant_File.close
end

# Write term to the MUTANT_LOG.log
def save_term_id(term_id)
puts term_id

    if get_term_id(term_id).nil?
      org_File = File.new(MUTANT_LOG, 'a+')
      org_File.puts "TERM:#{term_id}\n"
    else
      org_File = File.new(MUTANT_LOG, 'r')
      text = org_File.read

      replace = text.gsub!(get_term_id(term_id), "#{term_id}\n")
      File.open(org_File, "w") { |file| file.puts replace }
    end
    org_File.close

    return "TERM:#{term_id}"
  end

# Retrieves the term from the MUTANT_LOG.log file
def get_term_id()
    org_File = File.new(MUTANT_LOG, 'r')
    mylog = org_File.readlines
    mylog.each {|line|
#      puts "checking #{line}"
      if line =~ /TERM/ then
#        puts line
        org_File.close
        return line.split(':')[-1]
      else
 #       puts "No TERM found"
      end
    }
    org_File.close
    return nil
end
