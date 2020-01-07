require 'json'

package = JSON.parse(File.read('./package.json'))

Pod::Spec.new do |spec|
  spec.name           = "RNLoginWithApple"
  spec.version        = package['version']
  spec.summary        = package['description']
  spec.description    = package['description']
  spec.license        = package['license']
  spec.author         = package['author']
  spec.homepage       = package['homepage']
  spec.source         = { :git => package['homepage'], :tag => spec.version }

  spec.requires_arc   = true
  spec.platform       = :ios, '10.0'
  
  spec.source_files = "ios/lib/*.{h,m}"

  spec.dependency 'React'
end
