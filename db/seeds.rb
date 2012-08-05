user = User.find_by_nickname("zeke")

raw_commands = JSON.parse(File.open(Rails.root + 'db/old_commands.json').read).map(&:symbolize_keys)

Command.destroy_all

raw_commands.each do |raw|
  raw = Hashie::Mash.new raw
  next if raw.keyword.blank?
  puts raw.keyword
  user.commands.create!({
    keyword: raw.keyword,
    url: raw.url,
    name: raw.name,
    description: raw.description
  })
end