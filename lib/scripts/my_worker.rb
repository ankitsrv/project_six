loop do
  system "rake fetch:feeds"
  sleep(900)
end

