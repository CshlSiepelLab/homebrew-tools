class Vine < Formula
  desc "Variational Inference with Node Embedding"
  homepage "https://github.com/CshlSiepelLab/vine"
  url "https://github.com/CshlSiepelLab/vine/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "aa7de61a71c0c785d7f0e0b16657fe89463d7ff1a7d5cdbaf6eb4b4005189dc7"
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
