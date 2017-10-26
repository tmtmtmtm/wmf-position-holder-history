require 'bundler/setup'
require_relative 'lib/load_environment_from_yaml'

require 'wikidata_position_history'
require 'sinatra'

get '/' do
  redirect to('/position-history-holder')
end

get '/position-history-holder/?' do
  mediawiki_site = params[:mediawiki_site]
  page_title = params[:page_title]

  return erb(:homepage) unless mediawiki_site && page_title

  unless mediawiki_site =~ /^(www\.)?wikidata.org|[a-z]{2}.wikipedia.org$/
    halt "Disallowed mediawiki_site"
  end

  rewriter = WikidataPositionHistory::PageRewriter.new(
    mediawiki_site: mediawiki_site,
    page_title: page_title
  )

  begin
    rewriter.run!
  rescue MediawikiApi::LoginError
    halt "Please set WIKI_USERNAME and WIKI_PASSWORD environment variables"
  rescue => e
    halt "Error: #{e.message}"
  end

  redirect("https://#{mediawiki_site}/wiki/#{page_title}")
end
