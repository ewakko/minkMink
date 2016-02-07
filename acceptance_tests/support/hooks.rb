Before do
  $log_File = File.new("CUKELOG.log", 'a')
end

After  do |scenario|
    $log_File.close
end
