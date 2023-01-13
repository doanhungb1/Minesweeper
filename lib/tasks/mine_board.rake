namespace :mine_board do
  task :generate_sample_boards => [ :environment ] do
    number_of_boards = ARGV[1].to_i == 0 ? 20 : ARGV[1].to_i
    number_of_boards.times do |_i|
      width = (Random.rand(50) + 1)
      height = (Random.rand(50) + 1)
      mines = (Random.rand(width*height) + 1)
      name = Faker::Name.name
      creator_email = "#{name}@gmail.com"
      ::GenerateMineboard.call(
        name: name,
        width: width,
        height: height,
        mines: mines,
        creator_email: creator_email
      )
    end
  end
end
