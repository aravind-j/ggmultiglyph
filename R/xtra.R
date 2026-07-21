### This file is part of 'ggmultiglyph' package for R.

### Copyright (C) 2014-2026, ICAR-NBPGR.
#
# ggmultiglyph is free software: you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 2 of the License, or
# (at your option) any later version.
#
# ggmultiglyph is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  A copy of the GNU General Public License is available at
#  https://www.r-project.org/Licenses/

wlcm <- paste0("\n",
               "--------------------------------------------------------------------------------\n",
               "Welcome to ggmultiglyph version ", utils::packageDescription("ggmultiglyph")$Version, "\n",
               "\n", "\n",
               # "# To know how to use this package type:", "\n",
               # "  browseVignettes(package = 'ggmultiglyph')", "\n", "  for the package vignette.", "\n",
               # "\n",
               "# To know whats new in this version type:", "\n",
               "  news(package='ggmultiglyph')", "\n", "  for the NEWS file.", "\n",
               "\n",
               "# To cite the methods in the package type:", "\n",
               "  citation(package='ggmultiglyph')", "\n",
               "\n",
               "# To suppress this message use:", "\n",
               "  suppressPackageStartupMessages(library(ggmultiglyph))", "\n",
               "--------------------------------------------------------------------------------\n")

.onAttach <- function(lib, pkg, ...) {
  packageStartupMessage(wlcm)


}
