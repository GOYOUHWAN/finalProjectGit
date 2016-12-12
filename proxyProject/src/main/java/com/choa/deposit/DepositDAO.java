package com.choa.deposit;

import com.choa.deposit.DepositDTO;

public interface DepositDAO {

	//입금하기.
	public void depositWrite(DepositDTO dto);
	
}
