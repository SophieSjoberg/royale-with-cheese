Before("@tmdb") do
  api_url = 'http://api.themoviedb.org/3'.freeze
  fixtures_path = "#{::Rails.root}/spec/fixtures"

  genres_url = "#{api_url}/genre/movie/list?api_key=#{ENV['TMDB_API_KEY']}"
  body = File.open("#{fixtures_path}/genres_response_body.txt").read

  stub_request(:get, genres_url).to_return(status: 200, body: body)

  movies_url =
    "#{api_url}/discover/movie?api_key=#{ENV['TMDB_API_KEY']}"\
    '&sort_by=popularity.desc&with_genres=28'
  body = File.open("#{fixtures_path}/movies_response_body.txt").read

  stub_request(:get, movies_url).to_return(status: 200, body: body)
end


Before ('@stripe') do
  WebMock.disable!
end
