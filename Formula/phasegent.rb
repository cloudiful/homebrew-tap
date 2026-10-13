class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.27.0/phasegent-v2.27.0-aarch64-apple-darwin"
      sha256 "c8940ff249ea6f5c5e8ea1628011c4af733496497a40581ac66a4be4c2f08bd6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.27.0/phasegent-v2.27.0-aarch64-unknown-linux-gnu"
      sha256 "79c2f3b2b3a0de0d910b4d46b2da962dfe94cd829c660798162cc7e19c148f77"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.27.0/phasegent-v2.27.0-x86_64-unknown-linux-gnu"
      sha256 "32da6e93c8113e3ba89a0bffa1a6a390d58921d83127b98e74785f1f1c9b30cc"
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
