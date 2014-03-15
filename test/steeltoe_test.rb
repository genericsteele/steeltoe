require 'test_helper'

class SteeltoeTest < ActionDispatch::IntegrationTest
  teardown do
    clean_sprockets_cache
  end

  test 'engine is loaded' do
    assert_equal ::Rails::Engine, Steeltoe::Engine.superclass
  end

  test 'inconsolata is served' do
    %w(bold regular).each do |variant|
      %w(eot svg ttf woff).each do |type|
        get "/assets/inconsolata-#{variant}-webfont.#{type}"
        assert_response :success
      end
    end
  end

  test 'clear_sans is served' do
    %w(Bold BoldItalic Italic Regular).each do |variant|
      %w(eot svg ttf woff).each do |type|
        get "/assets/ClearSans-#{variant}-webfont.#{type}"
        assert_response :success
      end
    end
  end

  test 'stylesheet is served' do
    get '/assets/steeltoe.css'
    assert_fonts_included response
  end

  test 'stylesheet references asset pipeline' do
    get 'assets/steeltoe.css'
    %w(eot svg ttf woff).each do |type|
      %w(Bold BoldItalic Italic Regular).each do |variant|
        assert_match "/assets/ClearSans-#{variant}-webfont.#{type}", response.body
      end
      %w(bold regular).each do |variant|
        assert_match "/assets/inconsolata-#{variant}-webfont.#{type}", response.body
      end
    end
  end

  test 'stylesheet is valid in a sprocket require' do
    get 'assets/sprockets-require.css'
    assert_fonts_included response
  end

  test 'stylesheet is available in a sass import' do
    get 'assets/sass-import.css'
    assert_fonts_included response
  end

  test 'stylesheet is available in a scss import' do
    get 'assets/scss-import.css'
    assert_fonts_included response
  end

  private

  def clean_sprockets_cache
    FileUtils.rm_rf File.expand_path("../dummy/tmp",  __FILE__)
  end

  def assert_fonts_included(response)
    assert_response :success
    assert_match(/font-family:\s*"inconsolata";/, response.body)
    assert_match(/font-family:\s*"clear_sans";/, response.body)
  end
  
end
