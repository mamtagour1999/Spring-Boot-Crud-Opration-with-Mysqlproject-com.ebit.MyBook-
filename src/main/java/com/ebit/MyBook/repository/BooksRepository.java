package com.ebit.MyBook.repository;

import org.springframework.data.jpa.repository.JpaRepository; 
import com.ebit.MyBook.model.Books;

public interface BooksRepository extends JpaRepository<Books, Integer>
{
	
}







