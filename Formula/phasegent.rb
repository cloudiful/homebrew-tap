class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.10/phasegent-v2.21.10-aarch64-apple-darwin"
      sha256 "37f50fea7d23ca224e7d60860681a3aa5be6c8d0c4fedb3b12abd7aa3e65ed69"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.10/phasegent-v2.21.10-aarch64-unknown-linux-gnu"
      sha256 "2677a40e35367a1565ca8df4de4a04f5aec826e649eb948462855def40da2621"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.21.10/phasegent-v2.21.10-x86_64-unknown-linux-gnu"
      sha256 "886bad63962818c0062fc5c12f37b30ad4b988a275f57e53f19a061fcb48a8a5"
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
