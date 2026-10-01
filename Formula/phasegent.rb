class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.9/phasegent-v2.21.9-aarch64-apple-darwin"
      sha256 "393db66604f43916398fbc41ddc99ebda36847e4931de34cb095c3283d95d4da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.9/phasegent-v2.21.9-aarch64-unknown-linux-gnu"
      sha256 "1cb7d0fe9de3a90a125191d76f8b27f8d14dc8bfc37afda7cd99e6937059db49"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.9/phasegent-v2.21.9-x86_64-unknown-linux-gnu"
      sha256 "5df9bb7601a6b5c1119c6c8efe38248eb1c2d04b01cae19466cd7f4de44e6c2c"
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
