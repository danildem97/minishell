/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   export2.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ddemydov <ddemydov@student.42wolfsburg.de> +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/03/24 19:53:08 by dsas              #+#    #+#             */
/*   Updated: 2023/07/31 22:37:33 by ddemydov         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../inc/include.h"

int	b_export(char **args)
{
	int	i;

	if (!args[1])
	{
		print_export();
		return (1);
	}
	i = 1;
	while(args[i])
	{
		if (check_keyword(args[i]) || !args[i+1])
	{
		ft_putstr_fd("minishell: export: `", 2);
		ft_putstr_fd(args[0], 2);
		ft_putstr_fd("': not a valid identifier\n", 2);
		return (1);
	}
	if (!(ft_strrchr(args[i], ' ')))
		set_new(args[i]);
	
	set_new(ft_strjoin(args[i], args[i + 1]));
	i += 2;
	}
	return (0);
}
