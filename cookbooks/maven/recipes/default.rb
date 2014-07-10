
directory '/vagrant/.orenux-cache/maven'

remote_file '/vagrant/.orenux-cache/maven/apache-maven-3.2.2-bin.tar.gz' do
  source 'http://ftp.meisei-u.ac.jp/mirror/apache/dist/maven/maven-3/3.2.2/binaries/apache-maven-3.2.2-bin.tar.gz'
  checksum 'cce5914cf8797671fc6e10c4e034b453d854edf711cbc664b478d0f04934cb76'
end

bash 'maven_extract' do
  not_if <<-EOC
    test -d /opt/maven-3.2.2
  EOC
  code <<-EOC
    tar xfz /vagrant/.orenux-cache/maven/apache-maven-3.2.2-bin.tar.gz -C /opt
    mv /opt/apache-maven-3.2.2 /opt/maven-3.2.2
  EOC
end
