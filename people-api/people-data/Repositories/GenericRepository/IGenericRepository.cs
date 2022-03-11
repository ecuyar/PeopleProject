using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace people_data.Repositories.GenericRepository
{
    public interface IGenericRepository<T>
    {
        Task<T> Add(T entity);
        bool Update(T entity);
        bool UpdateGroup(List<T> entities);
        Task<T> GetById(int id);
        Task<IEnumerable<T>> GetAll();
        bool DeleteById(int id);
        Task<IEnumerable<T>> Where(Expression<Func<T, bool>> predicate);
    }
}
