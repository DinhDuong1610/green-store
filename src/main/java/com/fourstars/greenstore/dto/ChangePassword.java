package com.fourstars.greenstore.dto;

import org.hibernate.validator.constraints.Length;

import jakarta.validation.constraints.NotEmpty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChangePassword {
	@NotEmpty
	@Length(min = 6)
	private String newPassword;
	@NotEmpty
	@Length(min = 6)
	private String confirmPassword;
}
