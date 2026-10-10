class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.23.1/phasegent-v2.23.1-aarch64-apple-darwin"
      sha256 "aa7540594b11504b5374a655a4451020c4bfcd8ef717178b1eb2f2037e4a368e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.23.1/phasegent-v2.23.1-aarch64-unknown-linux-gnu"
      sha256 "e87cf8d3efdecb46fd5d53d218320487a8ecd98f809961b724185971c72838c8"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.23.1/phasegent-v2.23.1-x86_64-unknown-linux-gnu"
      sha256 "bd3f493731e4b9999e3f4945e7922c3a0917feb41934911b29ce2721127620ed"
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
