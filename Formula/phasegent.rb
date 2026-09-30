class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.5/phasegent-v2.21.5-aarch64-apple-darwin"
      sha256 "2a29ae11f66a9feb9f9908788d963e6d845d56d04f654745da3d8f18ce10cd04"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.5/phasegent-v2.21.5-aarch64-unknown-linux-gnu"
      sha256 "60f3ec2c0888be80a5e3a8bf86f7ecda3118f800b738a7054be39c8e21d88823"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.5/phasegent-v2.21.5-x86_64-unknown-linux-gnu"
      sha256 "35bd1dd9857f04aa120933cb14656539ea67f79cbeaba600d792bd23f2642c1e"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["phasegent-*"].first => "phasegent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phasegent --version")
  end
end
