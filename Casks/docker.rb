cask 'docker' do
  if MacOS.version <= :el_capitan
    version '18.06.1-ce-mac73,26764'
    sha256 '3429eac38cf0d198039ad6e1adce0016f642cdb914a34c67ce40f069cdb047a5'
  else
    version '2.1.0.1,37199'
    sha256 'b638696702d88308a49c5ff985055b6bb329afcfcd0c3ffda1c3fed6e078d01a'
  end

  url "https://download.docker.com/mac/stable/#{version.after_comma}/Docker.dmg"
  appcast 'https://download.docker.com/mac/stable/appcast.xml'
  name 'Docker Community Edition'
  name 'Docker CE'
  homepage 'https://www.docker.com/community-edition'

  auto_updates true

  app 'Docker.app'

  uninstall delete:    [
                         '/Library/PrivilegedHelperTools/com.docker.vmnetd',
                         '/private/var/tmp/com.docker.vmnetd.socket',
                         '/usr/local/bin/docker',
                         '/usr/local/bin/docker-compose',
                         '/usr/local/bin/docker-credential-osxkeychain',
                         '/usr/local/bin/docker-machine',
                         '/usr/local/bin/hyperkit',
                         '/usr/local/bin/notary',
                         '/usr/local/bin/vpnkit',
                         '/usr/local/bin/kubectl.docker',
                         '/usr/local/bin/kubectl',
                         '/usr/local/bin/docker-credential-desktop'
                       ],
            launchctl: [
                         'com.docker.helper',
                         'com.docker.vmnetd',
                       ],
            quit:      'com.docker.docker'

  zap trash: [
               '/usr/local/bin/docker-compose.backup',
               '/usr/local/bin/docker-machine.backup',
               '/usr/local/bin/docker.backup',
               '~/Library/Application Scripts/com.docker.helper',
               '~/Library/Caches/KSCrashReports/Docker',
               '~/Library/Caches/com.docker.docker',
               '~/Library/Caches/com.plausiblelabs.crashreporter.data/com.docker.docker',
               '~/Library/Containers/com.docker.docker',
               '~/Library/Containers/com.docker.helper',
               '~/Library/Group Containers/group.com.docker',
               '~/Library/Preferences/com.docker.docker.plist',
             ],
      rmdir: [
               '~/Library/Caches/KSCrashReports',
               '~/Library/Caches/com.plausiblelabs.crashreporter.data',
             ]
end
