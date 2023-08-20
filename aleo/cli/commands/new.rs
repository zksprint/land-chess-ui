// Copyright (C) 2019-2023 Aleo Systems Inc.
// This file is part of the Aleo SDK library.

// The Aleo SDK library is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// The Aleo SDK library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with the Aleo SDK library. If not, see <https://www.gnu.org/licenses/>.

use crate::CurrentNetwork;
use snarkvm::{package::Package, prelude::ProgramID};

use anyhow::Result;
use clap::Parser;
use colored::Colorize;
use core::str::FromStr;

/// Create a new Aleo package.
#[derive(Debug, Parser)]
pub struct New {
    /// The program name.
    name: String,
}

impl New {
    /// Creates an Aleo package with the specified name.
    pub fn parse(self) -> Result<String> {
        // Derive the program directory path.
        let mut path = std::env::current_dir()?;
        path.push(&self.name);

        // Create the program ID from the name.
        let id = ProgramID::<CurrentNetwork>::from_str(&format!("{}.aleo", self.name))?;

        // Create the package.
        Package::create(&path, &id)?;

        // Prepare the path string.
        let path_string = format!("(in \"{}\")", path.display());

        Ok(format!("✅ Created an Aleo program '{}' {}", self.name.bold(), path_string.dimmed()))
    }
}
