class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.15.0/phasegent-v2.15.0-aarch64-apple-darwin"
      sha256 "511230c759932763ad5d12fa92956b1f99e1bb43ebfd69ac27322c524ad561c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.15.0/phasegent-v2.15.0-aarch64-unknown-linux-gnu"
      sha256 "21cb32a906a4e163dbb31ace6d53e24064c03dac37aa032e4196a179260dcc22"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.15.0/phasegent-v2.15.0-x86_64-unknown-linux-gnu"
      sha256 "1721ab2d94ad645e12def02c285e23f66f155134ba72a4ef74926bbd3a177901"
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
