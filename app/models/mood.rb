class Mood
  include SmartInit
  attr_accessor :level, :date

  def self.submit mood, &block
    BW::HTTP.post("http://localhost:3000/moods/new", { payload: BW::JSON.generate({ mood: mood }) }) do |response|
      if response.ok?
        block.call
      else
        App.alert(response.error_message)
      end
    end
  end

  def self.list &block
    BW::HTTP.get("http://localhost:3000/moods") do |response|
      puts "moods: #{response.body}"
      response = BW::JSON.parse(response.body.to_str)
      mood_list = response.inject([]) do |list, mood|
        list << Mood.new(date: mood['created_at'], level: mood['level'])
      end
      block.call(mood_list)
    end
  end
end