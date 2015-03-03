require 'json'

COHORT_FILE = ARGV[0]
DONT_PAIR_FILE = ARGV[1]

USERS     = JSON.parse(File.read(COHORT_FILE))
DONT_PAIR = JSON.parse(File.read(DONT_PAIR_FILE)) if DONT_PAIR_FILE

def make_pair pairs
  user = pairs.keys.shuffle.first
  previous_pairs = pairs.delete(user)
  available_pairs = pairs.keys - previous_pairs
  if DONT_PAIR.include? user
    available_pairs -= DONT_PAIR
  end

  if available_pairs.empty?
    available_pairs = pairs.keys
    USERS[user] = []
  end

  if pair = available_pairs.shuffle.first
    pairs.delete(pair)

    USERS[user] << pair
    USERS[pair] << user

    "Pair: #{user}, #{pair}"
  else
    "Solo: #{user}"
  end
end

to_pair = USERS.clone
puts make_pair(to_pair) until to_pair.empty?

File.open(COHORT_FILE, 'w') { |file| file.write JSON.generate(USERS) }
