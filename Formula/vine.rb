class Vine < Formula
  desc "Variational Inference with Node Embedding"
  homepage "https://github.com/CshlSiepelLab/vine"
  url "https://github.com/CshlSiepelLab/vine/archive/refs/tags/v0.3.5.tar.gz"
  sha256 "9ec46b057c1cd36fc2dda36f9b93e51a1acdb922caa86bfaba29af99c5c33253"
  license "BSD-3-Clause"

  depends_on "cmake" => :build
  depends_on "phast"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args,
             "-DPHAST_ROOT=#{Formula["phast"].opt_prefix}"
      system "cmake", "--build", "."
      system "cmake", "--install", "."
    end
  end

  test do
    system "#{bin}/vine", "--help"
  end
end
