cask 'unity-ios-support-for-editor@2017.4.11f1' do
  version '2017.4.11f1,8c6b8ef6d111'
  sha256 :no_check

  url "https://download.unity3d.com/download_unity/8c6b8ef6d111/MacEditorTargetInstaller/UnitySetup-iOS-Support-for-Editor-2017.4.11f1.pkg"
  name 'iOS Build Support'
  homepage 'https://unity3d.com/unity/'

  pkg 'UnitySetup-iOS-Support-for-Editor-2017.4.11f1.pkg'

  depends_on cask: 'unity@2017.4.11f1'

  preflight do
    if File.exist? "/Applications/Unity"
      FileUtils.move "/Applications/Unity", "/Applications/Unity.temp"
    end

    if File.exist? "/Applications/Unity-2017.4.11f1"
      FileUtils.move "/Applications/Unity-2017.4.11f1", '/Applications/Unity'
    end
  end

  postflight do
    if File.exist? '/Applications/Unity'
      FileUtils.move '/Applications/Unity', "/Applications/Unity-2017.4.11f1"
    end

    if File.exist? '/Applications/Unity.temp'
      FileUtils.move '/Applications/Unity.temp', '/Applications/Unity'
    end
  end

  uninstall quit:    'com.unity3d.UnityEditor5.x',
            delete:  '/Applications/Unity-2017.4.11f1/PlaybackEngines'
end
