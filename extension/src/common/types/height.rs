use std::ops::Deref;

use arma_rs::FromArma;

#[derive(Debug, Clone, Copy)]
/// Height in meters
pub struct Height(f64);

impl Height {
    pub fn new(height: f64) -> Self {
        Self(height)
    }
}

impl FromArma for Height {
    fn from_arma(value: String) -> Result<Self, String> {
        Ok(Self(value.parse::<f64>().map_err(|_| "Invalid height")?))
    }
}

impl AsRef<f64> for Height {
    fn as_ref(&self) -> &f64 {
        &self.0
    }
}

impl Deref for Height {
    type Target = f64;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}