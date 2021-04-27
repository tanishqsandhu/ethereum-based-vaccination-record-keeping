pragma solidity >=0.4.22 <0.6.0;


contract VaccinationRecord {

    struct Patient {
        string vaccineBrand;
        uint firstDoseLotNum; 
        bool firstDose;  // if true, that person received first vaccine
        uint256 firstDoseDate; 
        string firstDoseSite;
        string firstDoseAddress;
        uint secondDoseLotNum; 
        bool secondDose;  // if true, that person received second vaccine
        uint256 secondDoseDate; 
        string secondDoseSite;
        string secondDoseAddress;
    }
    
    function vaccinationStatus() public view
            returns (string status_)
    {
        if (firstDose && secondDose) {
		status = "Fully Vaccinated";
	} else if (firstDose) {
         	status = "First Dose";
	} else {
		status = "Vaccination Not Started";
	}

	return status;
    }

    function firstVaccine(string fds, string fda, uint256 fdd, uint fdln) {
	firstDose = true;
	firstDoseLotNum = fdln; 
	firstDoseDate = fdd; 
 	firstDoseSite = fds;
	firstDoseAddress = fad;

    }

    function secondVaccine(string sds, string sda, uint256 sdd, uint sdln) {
	secondDose = true;
	secondDoseLotNum = sdln; 
	secondDoseDate = sdd; 
 	secondDoseSite = sds;
	secondDoseAddress = sad;

    }

    function eligibilityForSecondVaccine() {
	if (vaccineBrand == "Johnson&Johnson") {
		return false;
	} else {
		if (firstDose == false) {
			return false;
		} else if (secondDose == false) {
			if (vaccineBrand == "Modern") {
				if (now - firstDoseDate >= (28 * 1 days)) {
					return true;
				} else {
					return false
				}
			} else (vaccineBrand == "Pfizer") {
				if (now - firstDoseDate >= (21 * 1 days)) {
					return true;
				} else {
					return false
				}
			}
		} else {
			return false;
		}
	}

    }
}