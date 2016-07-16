#
# Be sure to run `pod lib lint TTKeyboardAvoidingScrollView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TTKeyboardAvoidingScrollView'
  s.version          = '0.1.2'
  s.summary          = 'A UIScrollView subclass that automatically adjusts its insets to match the keyboard show/hide'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This UIScrollView subclass automatically adjusts its scroll insets to match the keyboard show/hide
                       DESC

  s.homepage         = 'https://github.com/dhiraj/TTKeyboardAvoidingScrollView'
  s.screenshots     = 'https://cloud.githubusercontent.com/assets/43901/16893494/4180c098-4b57-11e6-95f9-a7216d62c63c.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dhiraj Gupta' => 'dhiraj@traversient.com' }
  s.source           = { :git => 'https://github.com/dhiraj/TTKeyboardAvoidingScrollView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/dhiraj'

  s.ios.deployment_target = '6.0'

  s.source_files = 'TTKeyboardAvoidingScrollView/Classes/**/*'
  s.public_header_files = 'TTKeyboardAvoidingScrollView/Classes/**/*.h'
end
